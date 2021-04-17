class TransactionsController < ApplicationController
  # TODO: Add routes to each for examples for code reviewer
  def index
    @transactions = Transaction.all.group_by(&:payer)
  end

  def create
    if transaction_params[:points].to_i > 0
      # Based on example data when adding a positive pointed transaction, we should check for
      # existing negative transactions, and add to the negative value
      # as well, change to the new timestamp as we care more about the positive timestamp than the negative pointed timestamp
      negative_transaction =
        Transaction
          .where(Transaction.arel_table[:points].lt(0))
          .where(payer: transaction_params[:payer].upcase)
          .order(timestamp: :asc)
          .first

      if negative_transaction
        negative_transaction.update!(
          points: negative_transaction.points + transaction_params[:points].to_i,
          timestamp: transaction_params[:timestamp]
        )

        @transaction = negative_transaction
      else
        @transaction = Transaction.create!(transaction_params)
      end
    else
      @transaction = Transaction.create!(transaction_params)
    end

    render json: @transaction
  end

  def spend
    # Getting any transactions where points > 0 & ordering by first created
    @transactions = Transaction.where(Transaction.arel_table[:points].gt(0)).order(timestamp: :asc)

    points_spent = params[:points].to_i
    @transactions_used = []

    total_points = @transactions.sum(&:points)

    raise StandardError.new "You tried to spend #{points_spent}, when you only have #{total_points}" if total_points < points_spent

    @transactions.each do |transaction|
      points_spent -= transaction.points

      points_left =
        if points_spent < 0
          # abs is short for absolute, example: -200 would become 200
          points_spent.abs
        else
          0
        end

      transaction.points_spent = points_left - transaction.points

      @transactions_used << transaction

      transaction.update!(points: points_left)

      break if points_spent <= 0
    end
  end

  private

  def transaction_params
    params.permit(
      %i[
        payer
        points
        timestamp
      ]
    )
  end
end

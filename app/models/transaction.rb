class Transaction < ApplicationRecord
  # TODO: Add Validations
  # TODO: Add seeds

  # getter/setter for virtual attribute used in TransactionsController#spend to track how many points the user spent on each payer
  attr_accessor :points_spent

  validates :payer, :points, :timestamp, presence: true
  validate :payer_points_greater_than_0

  before_validation :upcase_payer

  private

  # Forcing all payer names to uppercase for easier querying by payer
  def upcase_payer
    self.payer.upcase!
  end

  def payer_points_greater_than_0
    transactions = Transaction.where(payer: payer)

    if transactions.sum(&:points) + points < 0
      errors.add(:base, 'Points for a payer must not drop below 0.')
      false
    end
  end
end

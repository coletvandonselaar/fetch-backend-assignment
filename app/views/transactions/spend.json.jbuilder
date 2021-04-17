json.transactions @transactions_used.group_by(&:payer).each do |payer, transactions|
  json.payer payer
  json.points transactions.sum(&:points_spent)
end
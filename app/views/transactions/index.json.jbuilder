json.transactions @transactions.each do |payer, transactions|
  json.payer payer
  json.points transactions.sum(&:points)
end
def make_change(amount, coins = [1, 5, 10, 25])
  changes = (0..amount).to_a
  changes[0] = []
  coins.sort!.reverse!
  1.upto(amount) do |amt|
    coins.each do |coin|
      if coin <= amt
        rem = amt - coin
        changes[amt] = [coin] + Array(changes[rem])
        break
      end
    end
  end
  changes.last
end

p make_change(91)
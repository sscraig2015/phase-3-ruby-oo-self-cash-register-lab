require 'pry'

class CashRegister
    attr_accessor :total, :last_transaction
    attr_reader  :discount, :items

    def initialize(discount = 0, items = [])
        @total = 0
        @discount = discount
        @items = items
    
    end

    def add_item(item, price, quantity=0)
        @last_transaction = [item, price, quantity]
        unless quantity > 0
            self.total += price
            self.items << item
        else 
            self.total += price * quantity
            quantity.times {self.items << item}
        end
    end

    def apply_discount()
        if @discount == 0
            "There is no discount to apply."
        else
            self.total -= (((self.discount.to_f)/100) * self.total)
            self.total = self.total.to_i
            return "After the discount, the total comes to $#{self.total}."
        end       
    end

    def void_last_transaction()
        if @quantity == 0
            binding.pry
            self.total -= self.last_transaction[1]
            self.items.delete_at(self.items.index(self.last_transaction[0]))
            
        else
            self.total -= (self.last_transaction[1] * self.last_transaction[2])
            self.last_transaction[2].times {self.items.delete_at(self.items.index(self.last_transaction[0]))}
        end
    
    end

end

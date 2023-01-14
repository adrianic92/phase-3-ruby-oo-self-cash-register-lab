class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :last_item_cost

    def initialize( discount = 0 )
        @discount = discount
        @total = 0
        @items = []
        @last_item_cost = 0
    end

    def add_item(title, price, quantity = 1)
        self.last_item_cost = price * quantity
        quantity.times do |i|
            self.items << title
        end
        self.total = total + price*quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = self.total * (100 - self.discount) / 100
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total -= self.last_item_cost
    end

end
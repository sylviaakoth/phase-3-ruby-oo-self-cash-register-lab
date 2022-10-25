class CashRegister
    attr_accessor :discount, :total, :item_list
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @item_list = []
     end

     def add_item (title, price, quantity=1)
        @total += price*quantity
        @item_list << {name: title, price: price, quantity: quantity}
     end

     def apply_discount
        @total = @total * (100 - @discount.to_i)/100
        if @discount > 0
            "After the discount, the total comes to $#{@total}."
        else
           "There is no discount to apply." 
    end
    end
    def items
        new_item_list = []
        item_list.map do |item| 
          item[:quantity].times { |index| new_item_list << item[:name]}
        end
        new_item_list
      end
      def void_last_transaction
        last_item = item_list[-1]

        @total -= (last_item[:price]*last_item[:quantity])
        
      end
    
        
end

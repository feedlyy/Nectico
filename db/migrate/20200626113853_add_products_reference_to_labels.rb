class AddProductsReferenceToLabels < ActiveRecord::Migration[6.0]
  def change
    add_reference :labels, :products, null: false, foreign_key: true
  end
end

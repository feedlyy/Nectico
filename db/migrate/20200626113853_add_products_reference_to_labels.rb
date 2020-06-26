class AddProductsReferenceToLabels < ActiveRecord::Migration[6.0]
  def change
    add_reference :labels, :product, null: false, foreign_key: true
  end
end

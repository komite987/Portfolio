class AddSortToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :sort, :integer
  end
end

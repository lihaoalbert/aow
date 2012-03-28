#encoding: utf-8
class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :compNameEN
      t.string :compNameCN
      t.string :businessLine
      t.date :foundationDate
      t.float :legalDuration
      t.string :legalNature
      t.float :registeredCapital
      t.float :investment
      t.string :corpRepresentative
      t.string :regAddressEN
      t.string :regAddressCN
      t.string :operAddressEN
      t.string :operAddressCN
      t.string :postCode
      t.string :tel
      t.string :fax
      t.string :province
      t.string :city
      t.string :county
      t.string :datasource
      t.string :memo
      t.float :registeredCapitalRMB
      t.string :investmentRMB
      t.integer :status
      t.integer :statusYear
      t.boolean :auditFlag

      t.timestamps
    end
  end
end

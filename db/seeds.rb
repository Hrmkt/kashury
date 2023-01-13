# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

def self.reset_pk_sequense(table_name)
    case ActiveRecord::Base.connection.adapter_name
    when 'SQLite'
        ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='#{table_name}'")
    when 'PostgreSQL'
        ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',1,false)")
    else
        raise "Task not implemented for this DB adapter"
    end
end

Label.delete_all
reset_pk_sequense("labels")

Label.create(tag: "AAAA")
Label.create(tag: "BBBB")
Label.create(tag: "CCCC")
Label.create(tag: "DDDD")
Label.create(tag: "EEEE")


District.delete_all
reset_pk_sequense("districts")

CSV.foreach("db/districts.csv",headers:true) do |row|
    District.create(
        name: row["name"]
    )
end
User.create(email: "admin@admin.com",password: "xxxxxxxx",password_confirmation:"xxxxxxxx",name: "管理者",admin:true)

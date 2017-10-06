require_relative '../db/sql_runner'

class Film

attr_accessor :title, :price
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @price = options['price'].to_i()
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql, "save_film", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    values = []
    SqlRunner.run(sql, "delete_all_films", values)
  end

end

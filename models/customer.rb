require_relative '../db/sql_runner'

class Customer

attr_accessor :name, :funds
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, "save_customer", values)
    @id = result[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_customer", values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, "update_customer", values)
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    values = []
    results = SqlRunner.run(sql, "show_all_customers", values)
    return results.map {|customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    values = []
    SqlRunner.run(sql, "delete_all_customers", values)
  end

  def films()
    sql = "SELECT films.* FROM films
     INNER JOIN tickets
     ON tickets.film_id = films.id
     WHERE customer_id = $1;"
     values = [@id]
     results = SqlRunner.run(sql, "show_customer_films", values)
     return results.map {|film| Film.new(film)}
  end


end

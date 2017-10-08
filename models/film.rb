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

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_film", values)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    values = []
    results = SqlRunner.run(sql, "show_all_films", values)
    return results.map {|film| Film.new(film)}
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, "update_film", values)
  end

  def customers()
    sql = "SELECT customers.*
    FROM customers
    INNER JOIN tickets
    ON tickets.customer_id = customers.id
    WHERE film_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, "show_customers_for_film", values)
    return results.map {|customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    values = []
    SqlRunner.run(sql, "delete_all_films", values)
  end

  def count_tickets()
    sql = "SELECT * FROM tickets WHERE film_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, "count_customers_for_film", values)
    tickets = results.map {|ticket| Ticket.new(ticket)}
    return tickets.length()
  end

end

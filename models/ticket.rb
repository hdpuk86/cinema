require_relative '../db/sql_runner'

class Ticket

attr_accessor :customer_id, :film_id
attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id'].to_i()
    @film_id = options['film_id'].to_i()
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql, "save ticket", values)
    @id = result[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_ticket", values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    values = []
    SqlRunner.run(sql, "delete_all_tickets", values)
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    values = []
    results = SqlRunner.run(sql, "show_all_tickets", values)
    return results.map {|ticket| Ticket.new(ticket)}
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3;"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, "update_ticket", values)
  end


end

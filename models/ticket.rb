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

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    values = []
    SqlRunner.run(sql, "delete_all_tickets", values)
  end


end
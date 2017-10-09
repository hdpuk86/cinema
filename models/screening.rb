require_relative '../db/sql_runner'

class Screening

  attr_accessor :film_id, :show_time, :number_of_tickets
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
    @number_of_tickets = options['number_of_tickets'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (film_id, show_time) VALUES ($1, $2) RETURNING id;"
    values = [@film_id, @show_time]
    result = SqlRunner.run(sql, "save_screening", values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    values = []
    results = SqlRunner.run(sql, "show_all_sreenings", values)
    return results.map {|screening| Screening.new(screening)}
  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    values = []
    SqlRunner.run(sql, "delete_all_screenings", values)
  end

end

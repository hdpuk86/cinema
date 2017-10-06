require 'pg'

class SqlRunner

  def self.run(sql, tag, values)
    begin
    db = PG.connect({dbname: 'cinema', host: 'localhost'})
    db.prepare(tag, sql)
    result = db.exec_prepared(tag, values)
    ensure
    db.close()
    end
    return result
  end

end

require 'pry-byebug'

require_relative '../models/customer'
require_relative '../models/film'
require_relative '../models/ticket'
require_relative '../models/screening'

Screening.delete_all()
Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({
  'name' => 'Hayley',
  'funds' => 100
  })
  customer1.save()
  customer2 = Customer.new({
    'name' => 'Amy',
    'funds' => 50
    })
    customer2.save()
    customer3 = Customer.new({
      'name' => 'Brad',
      'funds' => 400
      })
      customer3.save()

      customer2.funds = 30
      customer2.update()

      film1 = Film.new({
        'title' => 'The Lion King',
        'price' => 10
        })
        film1.save()
        film2 = Film.new({
          'title' => 'Resident Evil',
          'price' => 15
          })
          film2.save()
          film3 = Film.new({
            'title' => 'The Lego Movie',
            'price' => 10
            })
            film3.save()

            film3.price = 5
            film3.update()

            film4 = Film.new({
              'title' => 'It',
              'price' => 60
              })
              film4.save()

              screening1 = Screening.new({
                'film_id' => film1.id,
                'show_time' => '14:00'
                })
                screening1.save()
                screening2 = Screening.new({
                  'film_id' => film2.id,
                  'show_time' => '14:00'
                  })
                  screening2.save()
                  screening3 = Screening.new({
                    'film_id' => film2.id,
                    'show_time' => '18:00'
                    })
                    screening3.save()
                    screening4 = Screening.new({
                      'film_id' => film3.id,
                      'show_time' => '20:00'
                      })
                      screening4.save()
                      screening5 = Screening.new({
                        'film_id' => film4.id,
                        'show_time' => '00:00'
                        })
                        screening5.save()

                        ticket1 = Ticket.new({
                          'customer_id' => customer1.id(),
                          'screening_id' => screening1.id(),
                          'film_id' => film1.id
                          })
                          ticket1.save()
                          ticket2 = Ticket.new({
                            'customer_id' => customer2.id(),
                            'screening_id' => screening1.id(),
                            'film_id' => film1.id
                            })
                            ticket2.save()
                            ticket3 = Ticket.new({
                              'customer_id' => customer3.id(),
                              'screening_id' => screening4.id(),
                              'film_id' => film3.id
                              })
                              ticket3.save()
                              ticket4 = Ticket.new({
                                'customer_id' => customer3.id(),
                                'screening_id' => screening3.id(),
                                'film_id' => film2.id
                                })
                                ticket4.save()
                                ticket5 = Ticket.new({
                                  'customer_id' => customer1.id(),
                                  'screening_id' => screening3.id(),
                                  'film_id' => film2.id
                                  })
                                  ticket5.save()
                                  ticket6 = Ticket.new({
                                    'customer_id' => customer2.id(),
                                    'screening_id' => screening2.id(),
                                    'film_id' => film2.id
                                    })
                                    ticket6.save()

                                  binding.pry()
                                  nil

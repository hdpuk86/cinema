require 'pry-byebug'

require_relative '../models/customer'
require_relative '../models/film'
require_relative '../models/ticket'

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

      customer2.funds = 100
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

            ticket1 = Ticket.new({
              'customer_id' => customer1.id(),
              'film_id' => film1.id
              })
              ticket1.save()
              ticket2 = Ticket.new({
                'customer_id' => customer2.id(),
                'film_id' => film1.id
                })
                ticket2.save()
                ticket3 = Ticket.new({
                  'customer_id' => customer3.id(),
                  'film_id' => film3.id
                  })
                  ticket3.save()
                  ticket4 = Ticket.new({
                    'customer_id' => customer1.id(),
                    'film_id' => film2.id
                    })
                    ticket4.save()

                    ticket2.film_id = film2.id
                    ticket2.update()

                    binding.pry()
                    nil

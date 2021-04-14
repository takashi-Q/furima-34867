FactoryBot.define do
  factory :orderpurchaser do
    postal_code { '122-4456' }
    area_id { 2 }
    municipality { '米子' }
    adress { '俺' }
    telephone { '09009009090' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

class Contact
  def self.card
    card = VCardigan.create
    card.name 'Candy', 'Ocean'
    card.fullname "OceanCandy"
    card.email "contact@clank.us"
    card.phone ENV.fetch("FROM_PHONE")[/\d+$/]
    card[:item1].url 'http://oceancandy.clank.us'
    card
  end
end

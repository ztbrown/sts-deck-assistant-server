require 'mechanize'

def get_card_winrates(character)
  mechanize = Mechanize.new
  page = mechanize.get("http://spirelogs.com/stats/#{character}/card-winrate.php")
  character = Character.find_by_title(character)
  page.search('.tablesorter').first.search('tr').each_with_index do |row, index|
    unless (index == 0)
      card = Card.find_or_initialize_by(name: row.children[0].text)
      puts card.name
      card.picked = row.children[1].text
      card.winrate = row.children[2].text
      card.expected_winrate = row.children[3].text
      card.plus_minus = row.children[4].text
      card.character_id = character.id

      card.save!
    end
  end
end


namespace :winrates do
  task :silent => :environment do
    get_card_winrates('silent')
  end
  task :defect => :environment do
    get_card_winrates('defect')
  end
  task :ironclad => :environment do
    get_card_winrates('ironclad')
  end
  task :all => :environment do
    get_card_winrates('silent')
    get_card_winrates('defect')
    get_card_winrates('ironclad')
  end
end

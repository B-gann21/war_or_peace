require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index]
      return cards[index].rank
    else
      return 0
    end
  end

  def high_ranking_cards
    high_ranks = []

    cards.each do |card|
      high_ranks << card if card.rank >= 11
    end

    return high_ranks
  end

  def percent_high_ranking
    high_rank_percent = 0.0

    cards.each do |card|
      high_rank_percent += 1 if card.rank >= 11
    end

    return ((high_rank_percent / cards.length) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards << card
  end
end

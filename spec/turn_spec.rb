require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  describe '#initialize' do
    it 'exists with 2 players and spoils of war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe 'type' do
    it 'can be :basic' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
    end

    it 'can be :war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:war)
    end

    it 'can be :mutually_assured_desctruction' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:mutually_assured_desctruction)
    end

  end

  describe 'winner' do
    it 'returns the winner'do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.winner).to eq(player1)
    end

    it 'can return No Winner' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq("No Winner")
    end

  end

  describe 'pile_cards' do
    it 'moves cards from decks to spoils_of_war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7])
    end

    it 'removes cards from play if its a mutually assured desctruction' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      turn.pile_cards

      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7])

    end
  end

  describe 'award_spoils' do
    it "adds spoils_of_war to winner's deck" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq(player1)
      winner = turn.winner

      turn.pile_cards
      turn.award_spoils(winner)



      expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
      expect(player2.deck.cards).to eq([card4, card6, card7])
    end
  end
end

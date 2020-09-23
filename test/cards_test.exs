defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "deal keeps the right number of remainder cards" do
    deck = Cards.create_deck
    hand_size = 5
    remainder = length(deck) - hand_size

    {_hand, rest_of_deck} = Cards.deal(deck, hand_size)
    assert length(rest_of_deck) == remainder
  end

  test "deal gives the right amount of cards" do
    deck = Cards.create_deck
    hand_size = 9
    {hand, _rest_of_deck} = Cards.deal(deck, hand_size)
    assert length(hand) == hand_size
  end
end

require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Ir a new, llenar con palabra random, click en submit y obtener mensaje que no esta en la cuadricula" do
    visit new_url
    random_word = Array.new(10) { ("A".."Z").to_a.sample }.join
    fill_in "word", with: random_word
    click_on "Play"

    assert_text "Sorry but #{random_word.upcase} can't be built out of"
  end
end

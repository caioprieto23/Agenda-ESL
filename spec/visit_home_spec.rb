require 'rails_helper'

feature 'Visitante acessa home' do
    visit root_path

    expect(page).to have_content('Boas vindas!')
  end

  scenario 'e realiza uma pesquisa' do
    fill_in 'Pesquisa', with: 'Termo para ser pesquisado'
    click_in 'Buscar'

    expect(current_path).to eq(search_path)
    expect(page).to have_content('Um resultado encontrado')
  end
end
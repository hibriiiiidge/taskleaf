require 'rails_helper'

describe 'タスク一覧' do
  let(:task) { create(:task, name: 'test') }

  before do
    visit root_path
  end

  it do
    expect(page).to have_content('タスク一覧画面')
  end
end
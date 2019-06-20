# frozen_string_literal: true

shared_context 'when gon service is requested' do
  let(:gon) { RequestStore.store[:gon].gon }
  before { Gon.clear }
end

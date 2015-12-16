require 'spec_helper'

describe 'collections/_show_descriptions.html.erb', type: :view do
  context 'displaying a custom collection' do
    let(:collection_size) { 123_456_678 }
    let(:collection) do
      Collection.new(title: 'hmm', date_created: ['2000-01-01'])
    end
    before do
      allow(presenter).to receive(:total_items).and_return(2)
      assign(:presenter, presenter)
      allow(Sufia::CollectionSizeService).to receive(:run).and_return(collection_size)
    end

    let(:ability) { double }
    let(:solr_document) { SolrDocument.new(collection.to_solr) }
    let(:presenter) { Sufia::CollectionPresenter.new(solr_document, ability) }

    it "draws the metadata fields for collection" do
      render
      expect(rendered).to have_content 'Date Created'
      expect(rendered).to include('itemprop="dateCreated"')
      expect(rendered).to have_content 'Total Items'
      expect(rendered).to have_content '2'
      expect(rendered).to have_content 'Size'
      expect(rendered).to have_content '118 MB'
    end
  end
end
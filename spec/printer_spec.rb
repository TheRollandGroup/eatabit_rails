require 'spec_helper'

RSpec.describe EatabitRails::Printer do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Printer).to be
    end
  end

  context 'v2', version: :v2 do

    describe '.find' do

      let(:printer) { find_printer('v2') }

      it 'should return a EatabitRails::Printer' do
        expect(printer).to be_a(EatabitRails::Printer)
      end

      it 'should assign attributes' do
        expect(printer.id).to eq('fc4a764b-4822-45d5-b91f-bc808412002f')
        expect(printer.name).to eq('Eatabit.io Pizza')
        expect(printer.enabled).to eq(true)
        expect(printer.pickup_minutes).to eq(15)
        expect(printer.delivery_minutes).to eq(30)
        expect(printer.state).to eq('unavailable')
        expect(printer.online).to eq(false)
        expect(printer.paper).to eq(true)
      end
    end
  end

  context 'v4', version: :v4 do

    describe '.find' do

      let(:printer) { find_printer('v4') }

      it 'should return a EatabitRails::Printer' do
        expect(printer).to be_a(EatabitRails::Printer)
      end

      it 'should assign attributes' do
        expect(printer.id).to eq('fc4a764b-4822-45d5-b91f-bc808412002f')
        expect(printer.name).to eq('Eatabit.io Pizza')
        expect(printer.enabled).to eq(true)
        expect(printer.state).to eq('unavailable')
        expect(printer.online).to eq(false)
        expect(printer.paper).to eq(true)
        expect(printer.fulfillment).to eq(0)
        expect(printer.autoprint).to eq(false)
        expect(printer.sound).to eq(true)
        expect(printer.light).to eq(true)
      end
    end
  end

  def find_printer(version)
    VCR.use_cassette("printer_#{version}") do
      EatabitRails::Printer.find 'fc4a764b-4822-45d5-b91f-bc808412002f'
    end
  end
end

require_relative '../lib/my_method'

RSpec.describe Array do
    subject {described_class.new([1,2,3,4])}

    describe '#my_each'do
     context 'when the block is not given' do
        it {expect(subject.my_each).to be_an(Enumerator)}
     end
    
    context 'when the block is given' do
        let(:rezult) {[]}
        it 'calls the given block once for each element' do
            expect { |block| subject.my_each(&block)}.to yield_control.exactly(3).times 
        end

        it 'execute block' do
            subject.my_each {|element| rezult << element*3}
            expect(rezult).to eql([3,6,9,12])
        end
        
        it 'returns itself' do
            expect(subject.my_each {|element| element*3}).to eql(subject)
        end

        end
    end
end

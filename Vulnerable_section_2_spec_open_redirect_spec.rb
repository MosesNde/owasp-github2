                 expect(subject.vulnerable?).to be_truthy
               end
             end
           end
 
           context "when the content attribute is double quoted" do
                 expect(subject.vulnerable?).to be_truthy
               end
             end
           end
 
           context "when the content attribute is not quoted" do
                 expect(subject.vulnerable?).to be_truthy
               end
             end
           end
 
           context "when there is a space after the content attribute name" do
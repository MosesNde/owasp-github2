                 expect(subject.vulnerable?).to be_truthy
               end
             end

            context "and the url value is not quoted" do
              let(:response_body) do
                <<~HTML
                  <html>
                    <head>
                      <meta http-equiv="refresh" content='0;url=#{subject.test_url}'/>
                    </head>
                    <body>
                      <p>example content</p>
                      <p>included content</p>
                      <p>more content</p>
                    </body>
                  </html>
                HTML
              end

              it "must return true" do
                expect(subject.vulnerable?).to be_truthy
              end
            end
           end
 
           context "when the content attribute is double quoted" do
                 expect(subject.vulnerable?).to be_truthy
               end
             end

            context "and the url value is not quoted" do
              let(:response_body) do
                <<~HTML
                  <html>
                    <head>
                      <meta http-equiv="refresh" content="0;url=#{subject.test_url}"/>
                    </head>
                    <body>
                      <p>example content</p>
                      <p>included content</p>
                      <p>more content</p>
                    </body>
                  </html>
                HTML
              end

              it "must return true" do
                expect(subject.vulnerable?).to be_truthy
              end
            end
           end
 
           context "when the content attribute is not quoted" do
                 expect(subject.vulnerable?).to be_truthy
               end
             end

            context "and the url value is not quoted" do
              let(:response_body) do
                <<~HTML
                  <html>
                    <head>
                      <meta http-equiv="refresh" content=0;url=#{subject.test_url}/>
                    </head>
                    <body>
                      <p>example content</p>
                      <p>included content</p>
                      <p>more content</p>
                    </body>
                  </html>
                HTML
              end

              it "must return true" do
                expect(subject.vulnerable?).to be_truthy
              end
            end
           end
 
           context "when there is a space after the content attribute name" do
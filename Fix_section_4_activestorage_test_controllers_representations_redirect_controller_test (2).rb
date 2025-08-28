     assert_equal 100, image.height
   end
 end

class ActiveStorage::Representations::RedirectControllerWithOpenRedirectTest < ActionDispatch::IntegrationTest
  if SERVICE_CONFIGURATIONS[:s3]
    test "showing existing variant stored in s3" do
      with_raise_on_open_redirects(:s3) do
        blob = create_file_blob filename: "racecar.jpg", service_name: :s3

        get rails_blob_representation_url(
          filename: blob.filename,
          signed_blob_id: blob.signed_id,
          variation_key: ActiveStorage::Variation.encode(resize_to_limit: [100, 100]))

        assert_redirected_to(/racecar\.jpg/)
      end
    end
  end

  if SERVICE_CONFIGURATIONS[:azure]
    test "showing existing variant stored in azure" do
      with_raise_on_open_redirects(:azure) do
        blob = create_file_blob filename: "racecar.jpg", service_name: :azure

        get rails_blob_representation_url(
          filename: blob.filename,
          signed_blob_id: blob.signed_id,
          variation_key: ActiveStorage::Variation.encode(resize_to_limit: [100, 100]))

        assert_redirected_to(/racecar\.jpg/)
      end
    end
  end

  if SERVICE_CONFIGURATIONS[:gcs]
    test "showing existing variant stored in gcs" do
      with_raise_on_open_redirects(:gcs) do
        blob = create_file_blob filename: "racecar.jpg", service_name: :gcs

        get rails_blob_representation_url(
          filename: blob.filename,
          signed_blob_id: blob.signed_id,
          variation_key: ActiveStorage::Variation.encode(resize_to_limit: [100, 100]))

        assert_redirected_to(/racecar\.jpg/)
      end
    end
  end
end
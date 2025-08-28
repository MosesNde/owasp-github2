         /// Gets the message to send to KMS.
         /// </summary>
         /// <returns>The message</returns>
        public Binary GetMessage()
         {
             Binary binary = new Binary();
             Check(Library.mongocrypt_kms_ctx_message(_id, binary.Handle));
             return binary;
         }
 
         /// <summary>
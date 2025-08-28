         {
 #pragma warning disable 612, 618
             modelBuilder
                .HasAnnotation("ProductVersion", "2.1.1-rtm-30846")
                 .HasAnnotation("Relational:MaxIdentifierLength", 128)
                 .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);
 
 
                     b.ToTable("StreamAnnouncerSettings");
                 });
 #pragma warning restore 612, 618
         }
     }
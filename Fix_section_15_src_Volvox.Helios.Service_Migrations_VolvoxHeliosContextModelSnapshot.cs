         {
 #pragma warning disable 612, 618
             modelBuilder
                .HasAnnotation("ProductVersion", "2.1.2-rtm-30932")
                 .HasAnnotation("Relational:MaxIdentifierLength", 128)
                 .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);
 
 
                     b.ToTable("StreamAnnouncerSettings");
                 });

            modelBuilder.Entity("Volvox.Helios.Domain.ModuleSettings.StreamerRoleSettings", b =>
                {
                    b.Property<decimal>("GuildId")
                        .ValueGeneratedOnAdd()
                        .HasConversion(new ValueConverter<decimal, decimal>(v => default(decimal), v => default(decimal), new ConverterMappingHints(precision: 20, scale: 0)));

                    b.Property<bool>("Enabled");

                    b.Property<decimal>("RoleId")
                        .HasConversion(new ValueConverter<decimal, decimal>(v => default(decimal), v => default(decimal), new ConverterMappingHints(precision: 20, scale: 0)));

                    b.HasKey("GuildId");

                    b.ToTable("StreamerRoleSettings");
                });
 #pragma warning restore 612, 618
         }
     }
module RuGUI
  module Generator
    class Configuration
      def self.default_application_directory_structure
        [
          # bin directory contains executables for the application.
          'bin',
          # app directory contains the controllers, models, resources, and views.
          'app',
          'app/controllers',
          'app/models',
          'app/resources',
          'app/resources/glade',
          'app/resources/styles',
          'app/views',
          'app/views/helpers',

          # config directory contains environments configuration, boot file and
          # other configuration stuff.
          'config',
          'config/environments',

          # lib directory contains utility libraries which doesn't fit into a
          # separate gem or plugin. Also it contains additional rake tasks which
          # will be automatically added if present in lib/tasks.
          'lib',
          'lib/tasks',

          # log directory contains default log files for the application.
          'log',

          # vendor directory contains third-party software.
          'vendor',
        ]
      end
      
      def self.default_test_directory_structure
        [
          # test directory contains tests for controllers, models, views,
          # view_helpers, and libs. Test files should be named as
          # <test_class>_test.rb in order to be automatically recognized.
          'test',
          'test/controllers',
          'test/lib',
          'test/models',
          'test/views',
          'test/view_helpers',
        ]
      end
      
      def self.default_spec_directory_structure
        [
          # spec directory contains specs for controllers, models, views,
          # view_helpers, and libs. Spec files should be named as
          # <test_class>_spec.rb in order to be automatically recognized.
          'spec',
          'spec/controllers',
          'spec/lib',
          'spec/models',
          'spec/views',
          'spec/view_helpers',
        ]
      end
      
      def self.templates_path
        File.join(File.expand_path(File.dirname(__FILE__)), 'generator_templates')
      end
      
      def self.default_files_mapping
        [
          file_mapping('bin', 'main_executable.erb', 0700, true),
          file_mapping('bin', 'main_executable.bat.erb', 0700, true, '.bat'),
          file_mapping('app', 'main.rb', 0700),
          file_mapping('app/controllers', 'main_controller.rb'),
          file_mapping('app/controllers', 'application_controller.rb'),
          file_mapping('app/resources/glade', 'main_view.glade'),
          file_mapping('app/resources/styles', 'main.rc'),
          file_mapping('app/views', 'application_view.rb'),
          file_mapping('app/views', 'main_view.rb'),
          file_mapping('app/views/helpers', 'application_view_helper.rb'),
          file_mapping('app/views/helpers', 'main_view_helper.rb'),
          file_mapping('config', 'boot.rb'),
          file_mapping('config', 'environment.rb'),
          file_mapping('config/environments', 'development.rb.sample'),
          file_mapping('config/environments', 'test.rb.sample'),
          file_mapping('config/environments', 'production.rb.sample'),
          file_mapping('', 'README'),
          file_mapping('', 'Rakefile'),
        ]
      end
      
      def self.default_test_files_mapping
        [
          file_mapping('test', 'test_helper.rb'),
        ]
      end
      
      def self.default_spec_files_mapping
        [
          file_mapping('spec', 'spec_helper.rb'),
          file_mapping('spec', 'rcov.opts'),
          file_mapping('spec', 'spec.opts'),
        ]
      end
      
      private
        def self.file_mapping(destination, filename, mode = 0666, use_app_name_instead_of_filename = false, custom_extension = '')
          return {
            :destination => destination,
            :filename => filename,
            :mode => mode,
            :use_app_name_instead_of_filename => use_app_name_instead_of_filename,
            :custom_extension => custom_extension
          }
        end
    end
  end
end

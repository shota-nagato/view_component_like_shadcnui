# frozen_string_literal: true

class Button::Component < ApplicationViewComponent
  option :variant, default: proc { :default }
  option :size, default: proc { :default}
  option :html_classes, default: proc { "" }
  style do
    base {
      %w[inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0]
    }
    variants {
      variant {
        default {
          %w[bg-primary text-primary-foreground shadow hover:bg-primary/90]
        }
        outline {
          %w[border border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground]
        }
        destructive {
          %w[bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90]
        }
        secondary {
          %w[bg-secondary text-secondary-foreground shadow-sm hover:bg-secondary/80]
        }
        ghost {
          %[hover:bg-accent hover:text-accent-foreground]
        }
        link {
          %[text-primary underline-offset-4 hover:underline]
        }
      }
      size {
        default {
          %w[h-9 px-4 py-2]
        }
        sm {
          %w[h-8 rounded-md px-3 text-xs]
        }
        lg {
          %w[h-10 rounded-md px-8]
        }
        icon {
          "size-9"
        }
      }
    }
  end

  def merged_classes
    TailwindMerge::Merger.new.merge("#{style(variant:, size:)} #{html_classes}")
  end
end

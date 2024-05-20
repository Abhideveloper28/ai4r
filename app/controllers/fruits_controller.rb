class FruitsController < ApplicationController
    require 'ai4r'
    def index
        # Display a form to input fruit features
    end

    def classify
        # Parse form parameters and create a fruit instance
        fruit = Fruit.new(color: params[:color], size: params[:size], texture: params[:texture])
      
        # Sample dataset for classification
        dataset = [
          Fruit.new(color: "red", size: "small", texture: "smooth", label: "Apple"),
          Fruit.new(color: "yellow", size: "small", texture: "smooth", label: 'Banana'),
          Fruit.new(color: "yellow", size: "large", texture: "rough", label: 'Pineapple')
          # Add more fruits with different features
        ]
        features = dataset.map { |fruit| [fruit.color, fruit.size, fruit.texture] }
        class_labels = dataset.map { |fruit| fruit.label }
      
        # Combine features and labels into a single dataset
        cleaned_dataset = features.zip + class_labels
      
        # Create and build the decision tree
        id3 = Ai4r::Classifiers::ID3.new
        id3.build(cleaned_dataset)
      
        # Make a prediction
        predicted_class = id3.eval([fruit.color, fruit.size, fruit.texture])
      
        # Display the predicted class in the view
        @prediction = predicted_class
    end
end

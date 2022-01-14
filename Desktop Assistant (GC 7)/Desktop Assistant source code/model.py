import torch
import torch.nn as nn


class NeuralNet(nn.Module):
    def __init__(self, input_size, hidden_size, num_classes):
        super(NeuralNet, self).__init__()
        self.l1 = nn.Linear(input_size, hidden_size) #input_size as input and hidden_size as output
        self.l2 = nn.Linear(hidden_size, hidden_size) #parameter 1 is input and parameter 2 is output
        self.l3 = nn.Linear(hidden_size, num_classes)
        self.relu = nn.ReLU() #activation function
    
    def forward(self, x):
        out = self.l1(x)
        out = self.relu(out)
        out = self.l2(out)
        out = self.relu(out) 
        out = self.l3(out)
        # no activation and no softmax at the end
        return out
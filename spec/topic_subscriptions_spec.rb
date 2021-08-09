require 'yaml'

describe 'compiled component sqs' do
  
  context 'cftest' do
    it 'compiles test' do
      expect(system("cfhighlander cftest #{@validate} --tests tests/topic_subscriptions.test.yaml")).to be_truthy
    end      
  end
  
  let(:template) { YAML.load_file("#{File.dirname(__FILE__)}/../out/tests/topic_subscriptions/sqs.compiled.yaml") }
  
  context "Resource" do

    
    context "queue1" do
      let(:resource) { template["Resources"]["queue1"] }

      it "is of type AWS::SQS::Queue" do
          expect(resource["Type"]).to eq("AWS::SQS::Queue")
      end
      
      it "to have property QueueName" do
          expect(resource["Properties"]["QueueName"]).to eq({"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue1"]]})
      end
      
      it "to have property Tags" do
          expect(resource["Properties"]["Tags"]).to eq([{"Key"=>"Environment", "Value"=>{"Ref"=>"EnvironmentName"}}, {"Key"=>"EnvironmentType", "Value"=>{"Ref"=>"EnvironmentType"}}, {"Key"=>"Name", "Value"=>{"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue1"]]}}])
      end
      
    end
    
    context "queue1Subscription0" do
      let(:resource) { template["Resources"]["queue1Subscription0"] }

      it "is of type AWS::SNS::Subscription" do
          expect(resource["Type"]).to eq("AWS::SNS::Subscription")
      end
      
      it "to have property TopicArn" do
          expect(resource["Properties"]["TopicArn"]).to eq("topic_arn1")
      end
      
      it "to have property Protocol" do
          expect(resource["Properties"]["Protocol"]).to eq("sqs")
      end
      
      it "to have property Endpoint" do
          expect(resource["Properties"]["Endpoint"]).to eq({"Fn::GetAtt"=>["queue1", "Arn"]})
      end
      
    end
    
    context "queue1Subscription1" do
      let(:resource) { template["Resources"]["queue1Subscription1"] }

      it "is of type AWS::SNS::Subscription" do
          expect(resource["Type"]).to eq("AWS::SNS::Subscription")
      end
      
      it "to have property TopicArn" do
          expect(resource["Properties"]["TopicArn"]).to eq("topic_arn2")
      end
      
      it "to have property Protocol" do
          expect(resource["Properties"]["Protocol"]).to eq("sqs")
      end
      
      it "to have property Endpoint" do
          expect(resource["Properties"]["Endpoint"]).to eq({"Fn::GetAtt"=>["queue1", "Arn"]})
      end
      
    end
    
    context "queue1Policy" do
      let(:resource) { template["Resources"]["queue1Policy"] }

      it "is of type AWS::SQS::QueuePolicy" do
          expect(resource["Type"]).to eq("AWS::SQS::QueuePolicy")
      end
      
      it "to have property PolicyDocument" do
          expect(resource["Properties"]["PolicyDocument"]).to eq({"Version"=>"2012-10-17", "Statement"=>[{"Sid"=>"queue1Subscription0", "Action"=>"SQS:SendMessage", "Resource"=>{"Fn::GetAtt"=>["queue1", "Arn"]}, "Effect"=>"Allow", "Principal"=>{"Service"=>"sns.amazonaws.com"}, "Condition"=>{"ArnEquals"=>{"aws:SourceArn"=>"topic_arn1"}}}, {"Sid"=>"queue1Subscription1", "Action"=>"SQS:SendMessage", "Resource"=>{"Fn::GetAtt"=>["queue1", "Arn"]}, "Effect"=>"Allow", "Principal"=>{"Service"=>"sns.amazonaws.com"}, "Condition"=>{"ArnEquals"=>{"aws:SourceArn"=>"topic_arn2"}}}]})
      end
      
      it "to have property Queues" do
          expect(resource["Properties"]["Queues"]).to eq([{"Ref"=>"queue1"}])
      end
      
    end
    
    context "queue2" do
      let(:resource) { template["Resources"]["queue2"] }

      it "is of type AWS::SQS::Queue" do
          expect(resource["Type"]).to eq("AWS::SQS::Queue")
      end
      
      it "to have property QueueName" do
          expect(resource["Properties"]["QueueName"]).to eq({"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue2"]]})
      end
      
      it "to have property Tags" do
          expect(resource["Properties"]["Tags"]).to eq([{"Key"=>"Environment", "Value"=>{"Ref"=>"EnvironmentName"}}, {"Key"=>"EnvironmentType", "Value"=>{"Ref"=>"EnvironmentType"}}, {"Key"=>"Name", "Value"=>{"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue2"]]}}])
      end
      
    end
    
    context "queue2Subscription0" do
      let(:resource) { template["Resources"]["queue2Subscription0"] }

      it "is of type AWS::SNS::Subscription" do
          expect(resource["Type"]).to eq("AWS::SNS::Subscription")
      end
      
      it "to have property TopicArn" do
          expect(resource["Properties"]["TopicArn"]).to eq("topic_arn1")
      end
      
      it "to have property Protocol" do
          expect(resource["Properties"]["Protocol"]).to eq("sqs")
      end
      
      it "to have property Endpoint" do
          expect(resource["Properties"]["Endpoint"]).to eq({"Fn::GetAtt"=>["queue2", "Arn"]})
      end
      
    end
    
    context "queue2Policy" do
      let(:resource) { template["Resources"]["queue2Policy"] }

      it "is of type AWS::SQS::QueuePolicy" do
          expect(resource["Type"]).to eq("AWS::SQS::QueuePolicy")
      end
      
      it "to have property PolicyDocument" do
          expect(resource["Properties"]["PolicyDocument"]).to eq({"Version"=>"2012-10-17", "Statement"=>[{"Sid"=>"queue2Subscription0", "Action"=>"SQS:SendMessage", "Resource"=>{"Fn::GetAtt"=>["queue2", "Arn"]}, "Effect"=>"Allow", "Principal"=>{"Service"=>"sns.amazonaws.com"}, "Condition"=>{"ArnEquals"=>{"aws:SourceArn"=>"topic_arn1"}}}]})
      end
      
      it "to have property Queues" do
          expect(resource["Properties"]["Queues"]).to eq([{"Ref"=>"queue2"}])
      end
      
    end
    
    context "queue3" do
      let(:resource) { template["Resources"]["queue3"] }

      it "is of type AWS::SQS::Queue" do
          expect(resource["Type"]).to eq("AWS::SQS::Queue")
      end
      
      it "to have property QueueName" do
          expect(resource["Properties"]["QueueName"]).to eq({"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue3"]]})
      end
      
      it "to have property Tags" do
          expect(resource["Properties"]["Tags"]).to eq([{"Key"=>"Environment", "Value"=>{"Ref"=>"EnvironmentName"}}, {"Key"=>"EnvironmentType", "Value"=>{"Ref"=>"EnvironmentType"}}, {"Key"=>"Name", "Value"=>{"Fn::Join"=>["-", [{"Ref"=>"EnvironmentName"}, "queue3"]]}}])
      end
      
    end
    
  end

end
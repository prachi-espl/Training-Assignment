<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Project_Created</fullName>
        <description>New Project Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>prachisawant@eternussolutions.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Project_Creation</template>
    </alerts>
    <alerts>
        <fullName>Project_end_date_approaching</fullName>
        <description>Project end date approaching</description>
        <protected>false</protected>
        <recipients>
            <field>M_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_end_date_notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_for_end_date</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Update for end date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Assign_Calendar_Task</fullName>
        <actions>
            <name>New_Project_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISNULL( Name ) == FALSE</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>New_Project_Created</name>
                <type>Task</type>
            </actions>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>End_date_of_project_notification</fullName>
        <active>true</active>
        <formula>ISNULL( Name )  == FALSE</formula>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Project_end_date_approaching</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Project_Details__c.End_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Project_end_date_reached</fullName>
        <actions>
            <name>Update_for_end_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>End_Date__c  ==  TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>New_Project_Created</fullName>
        <assignedTo>prachisawant@eternussolutions.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Details__c.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>New Project Created</subject>
    </tasks>
</Workflow>

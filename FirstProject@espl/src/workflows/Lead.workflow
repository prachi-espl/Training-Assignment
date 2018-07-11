<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Follow_up_date_elapsation</fullName>
        <description>Follow up date elapsation</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Follow_up_date_elapsed</template>
    </alerts>
    <fieldUpdates>
        <fullName>Lead_Segregation_to_Mobile</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Mobile</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead Segregation to Mobile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Segregation_to_PhoneNo</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Landline</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead Segregation to PhoneNo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_allocation_to_NoNumber</fullName>
        <field>RecordTypeId</field>
        <lookupValue>No_Number</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Lead allocation to NoNumber</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_record_type_for_do_not_call</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Do_Not_Call</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update record type for do not call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Follow up date elapsed</fullName>
        <actions>
            <name>Follow_up_date_elapsation</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>Follow_up_date__c  &lt;  TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Segregation to DoNotCall</fullName>
        <actions>
            <name>Update_record_type_for_do_not_call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Segregation to Mobile</fullName>
        <actions>
            <name>Lead_Segregation_to_Mobile</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK( Phone ) &amp;&amp;  NOT(ISBLANK(  MobilePhone  )) &amp;&amp; NOT( DoNotCall )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Segregation to NoNumber</fullName>
        <actions>
            <name>Lead_allocation_to_NoNumber</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK( MobilePhone ) &amp;&amp; ISBLANK( Phone ) &amp;&amp; NOT( DoNotCall )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lead Segregation to PhoneNo</fullName>
        <actions>
            <name>Lead_Segregation_to_PhoneNo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISBLANK( MobilePhone ) &amp;&amp;  NOT(ISBLANK( Phone )) &amp;&amp; NOT( DoNotCall )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

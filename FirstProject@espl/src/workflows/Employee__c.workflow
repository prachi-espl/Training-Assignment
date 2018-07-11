<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Employee_record_deactivated</fullName>
        <description>Employee record deactivated</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Employee_deactivation_message</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_record_type_for_non_current_emp</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Non_Technical_bg</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Update record type for non-current  emp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>role_id_access</fullName>
        <field>Roleidcopy__c</field>
        <formula>Role_assigned__r.Name</formula>
        <name>role id access</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Record type assignment for non current employee</fullName>
        <actions>
            <name>Update_record_type_for_non_current_emp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Current_Employee__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Report_to_the_manager</fullName>
        <actions>
            <name>Employee_record_deactivated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Is_Active__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>onetoone</fullName>
        <actions>
            <name>role_id_access</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISNULL(  Name ) == FALSE</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

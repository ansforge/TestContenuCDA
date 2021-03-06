<?xml version="1.0" encoding="UTF-8"?><schema xmlns="http://purl.oclc.org/dsdl/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" queryBinding="xslt2" schemaVersion="CI-SIS_PPS-PAERPA_2021.01.sch">
    
    <title>Rapport de conformité du document aux spécifications du modèle PPS-PAERPA_2021.01</title>
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="jdv" uri="http://esante.gouv.fr"/>
    <ns prefix="svs" uri="urn:ihe:iti:svs:2008"/>
    
        
    <!--Suppressed abstract pattern dansJeuDeValeurs was here-->
    <!--Suppressed abstract pattern IVL_TS was here-->
    
     
    <!--Start pattern based on abstract dansJeuDeValeurs--><pattern xmlns:svs="urn:ihe:iti:svs:2008" id="JDV_ProblemePPSPAERPA-CISIS">
    <p>Conformité d'un élément codé obligatoire par rapport à un jeu de valeurs du CI-SIS</p>
    <rule context="cda:component/cda:section/cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1']/cda:code">
        <let name="att_code" value="@code"/>
        <let name="att_codeSystem" value="@codeSystem"/>
        <let name="att_displayName" value="@displayName"/>
        
        <assert test="(not(@nullFlavor) or 1)">
           [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>" ne doit pas comporter d'attribut nullFlavor.
        </assert> 
        
        <assert test="(             (@code and @codeSystem) or             (1 and              (@nullFlavor='UNK' or              @nullFlavor='NA' or              @nullFlavor='NASK' or              @nullFlavor='ASKU' or              @nullFlavor='NI' or              @nullFlavor='NAV' or              @nullFlavor='MSK' or              @nullFlavor='OTH')) or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE'))             )">
            [dansJeuDeValeurs] L'élément "<value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>" doit avoir ses attributs 
            @code, @codeSystem renseignés, ou si le nullFlavor est autorisé, une valeur admise pour cet attribut, ou un xsi:type différent de CD ou CE.
        </assert>
        
        <assert test="(             @nullFlavor or             (@xsi:type and not(@xsi:type = 'CD') and not(@xsi:type = 'CE')) or              (document($JDV_ProblemePPSPAERPA-CISIS)//svs:Concept[@code=$att_code and @codeSystem=$att_codeSystem])             )">
        
            [dansJeuDeValeurs] L'élément <value-of select="ClinicalDocument/component/structuredBody/component/section/entry/observation/code"/>
            [<value-of select="$att_code"/>:<value-of select="$att_displayName"/>:<value-of select="$att_codeSystem"/>] 
            doit faire partie du jeu de valeurs <value-of select="$JDV_ProblemePPSPAERPA-CISIS"/>.
        </assert>
    </rule>
</pattern>
        
    
    
    
    
    <phase id="CI-SIS_PPS-PAERPA_2021.01">
        
        <active pattern="variables"/>
        
        
        <active pattern="JDV_ProblemePPSPAERPA-CISIS"/>
        
    </phase>
    
    <pattern id="variables">
        <let name="JDV_ProblemePPSPAERPA-CISIS" value="'../jeuxDeValeurs/JDV_ProblemePPSPAERPA-CISIS.xml'"/>        
        
        <rule context="cda:ClinicalDocument">
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.20']"> 
                [CI-SIS_PPS-PAERPA_2021.01] Le templateId de conformité au modèle PPS-PAERPA_2021.01 (1.2.250.1.213.1.1.1.20) doit être présent.
            </assert>
            <assert test="./cda:code[@code='18776-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
                [CI-SIS_PPS-PAERPA_2021.01] L'élément code doit avoir @code ="18776-5" et @codeSystem = "2.16.840.1.113883.6.1"/&gt;. 
            </assert>
        </rule>        
        
                
        <rule context="cda:ClinicalDocument/cda:component/cda:structuredBody">            
            
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.44'])=1"> 
                [CI-SIS_PPS-PAERPA_2021.01] Erreur de conformité au modèle : La section "FR-Dispositions-medico-sociales" (1.2.250.1.213.1.1.2.44) est obligatoire [1..1].
            </assert>
            <assert test="count(cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.35'])=1"> 
                [CI-SIS_PPS-PAERPA_2021.01] Erreur de conformité au modèle : La section "FR-Statut-du-document" (1.2.250.1.213.1.1.2.35) est obligatoire [1..1].
            </assert>
        </rule>
    </pattern>
</schema>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:da="http://data.bcassessment.ca/DataAdvice/Formats/DAX/DataAdvice.xsd">
    <xsl:output method="text" encoding="utf-8"/>
    <xsl:mode streamable="yes" />
    
    
    <xsl:template match="/">    
        <xsl:variable name="sep">,</xsl:variable>
        <xsl:variable name="qual">&#34;</xsl:variable>
        
        <xsl:fork>  
 
            <xsl:sequence>
        <xsl:result-document href="output/folio.csv" method="text">
            <xsl:text>assessmentAreaCode,jurisdictionCode,folioID,rollNumber,folioStatus,folioStatusDescription</xsl:text>
            <xsl:text>&#10;</xsl:text>
           
            <xsl:for-each select="//da:FolioRecord/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:AssessmentArea/@code, $qual, $sep)" />
                <xsl:value-of select="concat($qual, ancestor::da:Jurisdiction/@code, $qual, $sep)" />
                <xsl:value-of select="concat($qual, @ID, $qual, $sep)"/>
                <xsl:value-of select="concat($qual, da:RollNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:FolioStatus, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:FolioStatusDescription, $qual)" />
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>  
        </xsl:sequence>
         
            <xsl:sequence>
                <xsl:result-document href="output/assessmentAreaKey.csv" method="text">
                    <xsl:value-of select="concat('assessmentAreaCode',$sep,'assessmentAreaDescription')"/>
                    <xsl:text>&#10;</xsl:text>
                    
                    <xsl:for-each select="//da:AssessmentArea">
                        <xsl:value-of select="concat($qual, @code, $qual, $sep)"/>
                        <xsl:value-of select="concat($qual, @description, $qual)"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                    
                </xsl:result-document>
            </xsl:sequence>
         
            <xsl:sequence>
                <xsl:result-document href="output/jurisdictionKey.csv" method="text">
                    <xsl:text>jurisdictionCode,jurisdictionDescription</xsl:text>
                    <xsl:text>&#10;</xsl:text>
                    
                    <xsl:for-each select="//da:Jurisdiction">
                        <xsl:value-of select="concat($qual, @code, $qual, $sep)"/>
                        <xsl:value-of select="concat($qual, @description, $qual)"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each>
                    
                </xsl:result-document>
            </xsl:sequence>
            
  
        <xsl:sequence>
        <xsl:result-document href="output/folioDescription.csv" method="text">
            <xsl:text>folioID,neighbourhoodCode,neighbourhoodDescription,actualUseCode,actualUseDescription,vacantFlag,tenureCode,tenureDescription,parkingArea,landDimensionType,landDimensionTypeDescription,landDimension,landWidth,landDepth,schoolDistrictCode,schoolDistrictDescription,regionalDistrictCode,regionalDistrictDescription,hospitalDistrictCode,hospitalDistrictDescription,manualClassCode,manualClassDescription</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:FolioDescription/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Neighbourhood/da:NeighbourhoodCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Neighbourhood/da:NeighbourhoodDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ActualUseCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ActualUseDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:VacantFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TenureCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TenureDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ParkingArea, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandMeasurement/da:LandDimensionType, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandMeasurement/da:LandDimensionTypeDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandMeasurement/da:LandDimension, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandMeasurement/da:LandWidth, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandMeasurement/da:LandDepth, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:SchoolDistrict/da:DistrictCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:SchoolDistrict/da:DistrictDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:RegionalDistrict/da:DistrictCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:RegionalDistrict/da:DistrictDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:RegionalHospitalDistrict/da:DistrictCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:RegionalHospitalDistrict/da:DistrictDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ManualClassCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ManualClassDescription, $qual)"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
            
   
        <xsl:sequence>
        <xsl:result-document href="output/folioDescriptionTax.csv" method="text">
            <xsl:text>folioID,BCTransitFlag,policeTaxFlag,addSchoolTax3Mto4MFlag,addSchoolTaxGreater4MFlag,candidateForSpecTaxFlag</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:FolioDescription/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:BCTransitFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PoliceTaxFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:AddSchoolTax3Mto4MFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:AddSchoolTaxGreater4MFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:CandidatForSpecTaxFlag, $qual)"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
 

            
        <xsl:sequence>
        <xsl:result-document href="output/sales.csv" method="text">
            <xsl:text>folioID,saleID,documentNumber,conveyanceDate,conveyancePrice,conveyanceType,conveyanceTypeDescription</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:Sale/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, @ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:DocumentNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ConveyanceDate, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ConveyancePrice, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ConveyanceType, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ConveyanceTypeDescription, $qual)"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
   
  
       
        <xsl:sequence>
        <xsl:result-document href="output/value.csv" method="text">
            <xsl:text>folioID,valueType,propertyClassCode,propertyClassDescription,propertySubclassCode,propertySubClassDescription,grossValueLand,grossValueImprovement,taxExemptValueLand,taxExemptValueImprovement,netValueLand,netValueImprovement</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:PropertyClassValues/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, local-name(parent::*), $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertyClassCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertyClassDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertySubClassCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertySubClassDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:GrossValues/da:LandValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:GrossValues/da:ImprovementValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TaxExemptValues/da:LandValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TaxExemptValues/da:ImprovementValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:NetValues/da:LandValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:NetValues/da:ImprovementValue, $qual)" />
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
            
   
      
        <xsl:sequence>
        <xsl:result-document href="output/valuation.csv" method="text">
            <xsl:text>folioID,taxExemptCode,taxExemptDescription,propertyClassCode,propertyClassDescription,landValue,improvementValue</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:ValuesByETC/snapshot()">
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TaxExemptCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:TaxExemptDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertyClassCode, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PropertyClassDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandValue, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ImprovementValue, $qual)" />
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
       

            
        <xsl:sequence>
        <xsl:result-document href="output/address.csv" method="text">
            <xsl:text>folioID,addressID,primaryFlag,streetNumber,unitNumber,streetDirectionPrefix,streetName,streetDirectionSuffix,streetType,city,province,postalCode,mapReferenceNumber</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:FolioAddress/snapshot()">            
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, @ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PrimaryFlag, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StreetNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:UnitNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StreetDirectionPrefix, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StreetName, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StreetDirectionSuffix, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StreetType, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:City, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ProvinceState, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PostalZip, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:MapReferenceNumber, $qual)"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
     
        <xsl:sequence>
        <xsl:result-document href="output/legalDescription.csv" method="text">
            <xsl:text>folioID,legalDescriptionID,formattedLegalDescription,PID,lot,strataLot,parcel,block,subBlock,plan,suburbanLot,part1,part2,part3,part4,districtLot,legalSubdivision,section,township,range,landDistrictCode,landDistrictDescription,portion,exceptPlan,firstNationsReserveNumber,firstNationReserveDescription,leaseLicenseNumber,landBranchFileNumber,airSpaceParcelNumber,legalText</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:for-each select="//da:LegalDescription/snapshot()">            
                <xsl:value-of select="concat($qual, ancestor::da:FolioRecord/@ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, @ID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:FormattedLegalDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:PID, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Lot, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:StrataLot, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Parcel, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Block, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:SubBlock, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Plan, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:SubLot, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Part1, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Part2, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Part3, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Part4, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:DistrictLot, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LegalSubdivision, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Section, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Township, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Range, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandDistrict, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandDistrictDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:Portion, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:ExceptPlan, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:FirstNationReserveNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:FirstNationReserveDescription, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LeaseLicenceNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LandBranchFileNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:AirSpaceParcelNumber, $qual, $sep)" />
                <xsl:value-of select="concat($qual, da:LegalText, $qual)" />
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
        </xsl:result-document>
        </xsl:sequence>
  
 
            
        </xsl:fork>
    </xsl:template> 
  
</xsl:stylesheet>

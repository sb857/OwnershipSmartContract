/* Smart contract determining ownership of a file on the blockchain by mapping
    it to a structure of timestamp and owner information. This blockchain mantains 
    FileHash mapping to such structures

    Author(s): Shrey Baid
*/

pragma solidity 0.5.8;

contract Ownership {
    /* Structure represnting owner information of a file in the Blockchain */
    struct FileMap 
        {
            uint timestamp;
            string owner;
        }


    mapping (string => FileMap) allFiles;

    event FileLogStatus(bool status, uint timestamp, string owner, string fileHash);


    /* Function to get owner information via FileHash 
       Parameter fileHash: A string representing a fileHash in the blockchain
    */
    function get(string memory fileHash) public view returns (uint timestamp, string memory owner)
    {
        return (allFiles[fileHash].timestamp, allFiles[fileHash].owner);
    }

    /* Function to add a file ownership information to the blockchain
       Parameter owner: A string representing the owner of the file
       Parameter fileHash: A string representing a fileHash to be added to the blockchain
    */
    function set(string memory owner, string memory fileHash) public
    {
        if(allFiles[fileHash].timestamp == 0)
        {
            allFiles[fileHash] = FileMap(block.timestamp, owner);
            emit FileLogStatus(true, block.timestamp, owner, fileHash);
        }

        else
        {
            emit FileLogStatus(true, block.timestamp, owner, fileHash);
        }
    }

    
}
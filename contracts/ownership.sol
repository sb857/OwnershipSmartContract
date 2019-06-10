pragma solidity 0.5.8;

contract Ownership {
    struct FileMap 
        {
            uint timestamp;
            string owner;
        }


    mapping (string => FileMap) allFiles;

    event FileLogStatus(bool status, uint timestamp, string owner, string fileHash);

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

    function get(string memory fileHash) internal view returns (uint timestamp, string memory owner)
    {
        return (allFiles[fileHash].timestamp, allFiles[fileHash].owner);
    }
}
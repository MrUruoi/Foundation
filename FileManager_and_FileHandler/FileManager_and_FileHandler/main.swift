// 파일 존재 확인
// func fileExists(atPath path: String) -> Bool

// 폴더 내 파일 목록
// func contentsOfDirectory(atPath path: String) throws -> [String]

// 파일 복사/이동/삭제
// func copyItem(at srcURL: URL, to dstURL: URL) throws
// func copyItem(atPath srcPath: String, toPath dstPath: String) throws
// func moveItem(at srcURL: URL, to dstURL: URL) throws
// func moveItem(atPath srcPath: String, toPath dstPath: String) throws
// func removeItem(at URL: URL) throws
// func removeItem(atPath path: String) throws


// FileHandler
// convenience init?(forReadingAtPath path: String)
// convenience init?(forWritingAtPath path: String)
// convenience init?(forUpdatingAtPath path: String)

// var offetInFile: UInt64 { get }
// func seekToEndOfFile() -> UInt64
// func seek(toFileOffset offset: UInt64)

// func readData(ofLength length: Int) -> Data
// func readDataToEndOfFile() -> Data
// func write(_ data: Data)

import Foundation

let srcDir = "/Users/dopamine100/Documents/test/SrcFolder/"
let fileName = "testFile.txt"
let dstDir = "/Users/dopamine100/Documents/test/DstFolder/"

let fileManager = FileManager.default

if fileManager.fileExists(atPath: dstDir + fileName) {
    print("Exists...")
} else {
    do {
        try fileManager.copyItem(atPath: srcDir + fileName, toPath: dstDir + fileName)
        print("Success...")
    }
    catch {
        print("Error...")
    }
}


do {
    let files = try fileManager.contentsOfDirectory(atPath: dstDir)
    print(files)
} catch {
    print("Error...")
}


if let handler = FileHandle(forUpdatingAtPath: dstDir + fileName) {
    handler.seekToEndOfFile()
    let data = "> _<\n".data(using: .utf8)!
    handler.write(data)
    handler.synchronizeFile()
    handler.closeFile()
}

if let hanlder = FileHandle(forReadingAtPath: dstDir + fileName) {
    let data = hanlder.readDataToEndOfFile()
    let str = String(decoding: data, as: UTF8.self)
    print(str)
}


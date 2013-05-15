using System;
using System.IO;

namespace Test
{
    public interface TestInterface<T>
    {
        /// <summary>
        /// interface introduction
        /// </summary>
        /// <param name="stream">the stream to store data.</param>
        /// <param name="data">the data to store.</param>
        void Test(Stream stream, T data);
    }
}

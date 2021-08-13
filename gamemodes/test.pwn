// useful-stuff.pwn
// author: Kirima2nd
// date: 13/08/2021

#include <a_samp>

#include <YSI_Core\y_utils>

// Testing file
#define RUN_TESTS
#include <YSI_Core\y_testing>

// 1.) Melakukan testing
// NOTE: mau player testing? tambahkan P sebelum TEST (PTEST)
#if 0
TEST_INIT__ NamaTesting()
{
    // ISI KODE UNTUK PERSIAPAN TESTING SEPERTI MEMASUKKAN NILAI ATAU HAL LAINNYA.
}

TEST__ NamaTesting()
{
    // ISI KODE TENTANG APA YANG INGIN KAMU TES, MISALKAN SAJA FUNGSI UNTUK MENGECEK SESUATU, DLL.
}

TEST_CLOSE__ NamaTesting()
{
    // KETIKA KODE SELESAI DI TESTING, KAMU BISA MEMBERSIHKAN VARIABEL ATAU MENUTUP SESUATU DISINI.
}
#endif

// 2.) Menggunakan va_return ketimbang sprintf
static g_sReturnedText[32];
TEST_INIT__ VaReturnTesting()
{
    format(g_sReturnedText, sizeof(g_sReturnedText), "Hello World");
}

TEST__ VaReturnTesting()
{
    TEST_REPORT(va_return("%s %d %d %d", g_sReturnedText, 1, 2, 3));
}

// 3.) Membuat variabel didalam ekspresi if & switch
TEST__ TestVariableExpressions()
{
    if (new a = random(2))
    {
        TEST_REPORT("a bernilai %d", a);
    }
    else
    {
        TEST_REPORT("a tidak diketahui");
    }

    switch (new a = random(13))
    {
        case 12:
        {
            TEST_REPORT("a bernilai 12");
        }
        default:
        {
            TEST_REPORT("a bernilai %d", a);
        }
    }
}

// 4.) Fungsi (macro) untuk ekspresi tertentu
TEST__ ExpressionThingTest()
{
    new b = random(15);
    
    if (IS_IN_RANGE(b, 10, 15))
    {
        TEST_REPORT("b berada di jarak antara 10 sampai 15");
    }
    TEST_REPORT("b bernilai %d", b);

    new c[24];
    if (isnull(c))
    {
        TEST_REPORT("c bernilai null/kosong.");
    }
    else
    {
        TEST_REPORT("c tidak bernilai null/kosong.");
    }
    
    // Saking banyaknya, silahkan cek sendiri di y_utils_impl.inc
}

// 5.) Menggunakan ReturnPlayerName & GetIP
PTEST__ TestReturnedUsername(playerid)
{
    // Nanya ke pemain pake ASK!
    // Biar nanti test nya bisa true/false
    new szAskedContent[45];
    format(szAskedContent, sizeof(szAskedContent), "%s, %d\n\nApakah output diatas memunculkan sesuatu?", ReturnPlayerName(playerid), GetIP(playerid));
    
    ASK(szAskedContent);
}

